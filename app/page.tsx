import Image from 'next/image';
import Link from 'next/link';

export default function Home() {
  return (
    <main className="relative h-[calc(100vh-73px)] flex flex-col items-center justify-center text-center px-4">
      {/* Image de fond */}
      <div className="absolute inset-0 z-0">
        <Image 
          src="/hero.png" 
          alt="Nourriture africaine" 
          fill
          className="object-cover object-center"
          priority 
        />
        
        {/* Overlay dégradé (remplace ton ancien overlay black/60) */}
        <div className="absolute inset-0 bg-gradient-to-b from-black/70 via-black/50 to-black/70" />
        
        {/* Pattern décoratif par-dessus */}
        <div className="absolute inset-0 bg-[url('/hero-pattern.svg')] bg-repeat opacity-20" />
      </div>
      
      {/* Contenu */}
      <div className="relative z-10 flex flex-col items-center gap-6 max-w-2xl">
        <h1 className="text-5xl md:text-6xl font-bold text-white leading-tight">
          Mange selon tes racines
        </h1>
        <p className="text-lg text-gray-200 max-w-lg">
          Planifie tes repas de la semaine avec des plats qui te ressemblent.
          Simple, local, savoureux.
        </p>
        <Link
          href="/preferences"
          className="bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-semibold px-8 py-3 rounded-full transition-all duration-300 transform hover:scale-105 shadow-lg hover:shadow-orange-500/25"
        >
          Générer mon plan →
        </Link>
      </div>
    </main>
  );
}