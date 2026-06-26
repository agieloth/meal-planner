"use client";

import React from "react";

interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
  helperText?: string;
  icon?: React.ReactNode;
  fullWidth?: boolean;
}

export function Input({
  label,
  error,
  helperText,
  icon,
  fullWidth = false,
  className = "",
  id,
  type = "text",
  disabled,
  ...props
}: InputProps) {
  const inputId = id || `input-${Math.random().toString(36).substr(2, 9)}`;

  return (
    <div className={fullWidth ? "w-full" : ""}>
      {label && (
        <label
          htmlFor={inputId}
          className="block text-sm font-medium text-gray-700 dark:text-gray-200 mb-2"
        >
          {label}
        </label>
      )}

      <div className="relative">
        {icon && (
          <span className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
            {icon}
          </span>
        )}

        <input
          id={inputId}
          type={type}
          disabled={disabled}
          className={`
            w-full px-4 py-2.5 text-base
            bg-white dark:bg-gray-900
            border-2 border-gray-200 dark:border-gray-700
            rounded-xl
            text-gray-900 dark:text-white
            placeholder:text-gray-400 dark:placeholder:text-gray-600
            transition-all duration-300
            focus-visible:outline-none
            focus:border-orange-500 focus:ring-2 focus:ring-orange-500/20
            disabled:bg-gray-50 dark:disabled:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed
            ${icon ? "pl-10" : ""}
            ${error ? "border-red-500 focus:border-red-500 focus:ring-red-500/20" : ""}
            ${className}
          `}
          {...props}
        />
      </div>

      {error && (
        <p className="text-sm text-red-600 dark:text-red-400 mt-1.5 flex items-center gap-1">
          <span>⚠️</span> {error}
        </p>
      )}

      {helperText && !error && (
        <p className="text-sm text-gray-500 dark:text-gray-400 mt-1.5">
          {helperText}
        </p>
      )}
    </div>
  );
}
