import type { Metadata } from 'next';
import { Geist } from "next/font/google";
import "./globals.css";
import { Providers } from './providers';
import Navbar from './components/Navbar';

const geist = Geist({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: "Mealroots",
  description: "Planifiez vos repas selon tes racines",
};

export default function RootLayout({
  children,
} : {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr" suppressHydrationWarning>
      <body className={geist.className}>
        <Providers>
          <Navbar />
          {children}
        </Providers>
      </body>
    </html>
  );
}