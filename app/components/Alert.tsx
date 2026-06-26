"use client";

import React from "react";

type AlertVariant = "success" | "error" | "warning" | "info";

interface AlertProps {
  variant?: AlertVariant;
  title?: string;
  description?: string;
  children?: React.ReactNode;
  icon?: React.ReactNode;
  className?: string;
  onClose?: () => void;
}

const variants: Record<
  AlertVariant,
  {
    bg: string;
    border: string;
    icon: string;
    textTitle: string;
    textDesc: string;
  }
> = {
  success: {
    bg: "bg-green-50 dark:bg-green-950/20",
    border: "border-green-200 dark:border-green-800",
    icon: "✓",
    textTitle: "text-green-900 dark:text-green-200",
    textDesc: "text-green-700 dark:text-green-300",
  },
  error: {
    bg: "bg-red-50 dark:bg-red-950/20",
    border: "border-red-200 dark:border-red-800",
    icon: "⚠️",
    textTitle: "text-red-900 dark:text-red-200",
    textDesc: "text-red-700 dark:text-red-300",
  },
  warning: {
    bg: "bg-yellow-50 dark:bg-yellow-950/20",
    border: "border-yellow-200 dark:border-yellow-800",
    icon: "⚡",
    textTitle: "text-yellow-900 dark:text-yellow-200",
    textDesc: "text-yellow-700 dark:text-yellow-300",
  },
  info: {
    bg: "bg-blue-50 dark:bg-blue-950/20",
    border: "border-blue-200 dark:border-blue-800",
    icon: "ℹ️",
    textTitle: "text-blue-900 dark:text-blue-200",
    textDesc: "text-blue-700 dark:text-blue-300",
  },
};

export function Alert({
  variant = "info",
  title,
  description,
  children,
  icon,
  className = "",
  onClose,
}: AlertProps) {
  const style = variants[variant];

  return (
    <div
      className={`
        flex gap-3 p-4 rounded-xl border-2
        ${style.bg} ${style.border}
        ${className}
      `}
      role="alert"
    >
      <span className="text-xl flex-shrink-0 mt-0.5">{icon || style.icon}</span>

      <div className="flex-1">
        {title && (
          <h3 className={`font-semibold ${style.textTitle}`}>{title}</h3>
        )}
        {description && (
          <p className={`text-sm ${style.textDesc} mt-1`}>{description}</p>
        )}
        {children && (
          <div className={`text-sm ${style.textDesc} mt-1`}>{children}</div>
        )}
      </div>

      {onClose && (
        <button
          onClick={onClose}
          className={`flex-shrink-0 text-lg opacity-60 hover:opacity-100 transition-opacity`}
          aria-label="Close alert"
        >
          ✕
        </button>
      )}
    </div>
  );
}
