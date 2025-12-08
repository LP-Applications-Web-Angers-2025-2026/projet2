=====================================================================
Author: Jean-Michel RICHER
Date: September 2025
=====================================================================

SUMMARY
=====================================================================
  We try to determine the influence of the -ffast-math command line
argument of gcc/g++.


=====================================================================


L'option -ffast-math active un ensemble d'autre optimisations, dites agressives,
dont le but est d'optimiser le temps de calcul en évitant certaines vérifications
qui prennent du temps. Notamment cette option active entre autres optimisations :

\begin{itemize}

\item[$\bullet$]
\ttt{--fno-rounding-math} : qui permet de ne pas prendre en compte le mode de calcul
de l'arrondi qui sera considéré par défaut à "round to nearest" (voir ci-après)

\item[$\bullet$]
\ttt{--fno-signed-zeros} : qui considère que -0.0 et +0.0 sont équivalents à +0.0

\item[$\bullet$]
\ttt{--fno-trapping-math} : évite de générer du code qui vérifie la correction d'un 
résultat comme le dépassement de capacité, la division par zéro ou le résultat
d'opérations invalides comme le calcul de la racine carrée d'un nombre négatif

\item[$\bullet$]
\ttt{--funsafe-math-optimizations} : permet des transformations qui sont susceptibles
de modifier les calculs, notamment $(a + b) + c$ est potentiellement différent
de $a + (b + c)$ en raison des erreurs d'arrondi ; le compilateur peut donc effectuer
les changements qu'il désire afin d'optimiser les calculs 

\item[$\bullet$]
\ttt{--ffinite-math-only} : cette option considère que les calculs seront toujours 
corrects et qu'on ne trouvera pas de résultat d'opération comme \ttt{Nan} (Not a Number)
ou l'infini

\end{itemize}

En résumé, \ttt{-ffast-math} permet d'optimiser le temps de calcul au détriment de la
précision du résultat.

\subsubsection{Arrondi}

La méthode d'arrondi \tit{round to nearest} (arrondi au plus proche) est la méthode 
d'arrondi par défaut pour les nombres à virgule flottante dans la norme IEEE 754.

\begin{itemize}

\item[$\bullet$] 
si le nombre est plus proche de la valeur inférieure, il est arrondi 
vers le bas : 7,3 est plus proche de 7 que de 8, donc il est arrondi à 7

\item[$\bullet$]
si le nombre est plus proche de la valeur supérieure, il est arrondi 
vers le haut :  7,6 est plus proche de 8 que de 7, donc il est arrondi à 8

\end{itemize}


Un autre mode d'arrondi est l'arrondi au milieu ou \tit{liaison vers le pair}
(en anglais, \tit{ties to even}). Cela permet d'éviter les biais statistiques : 
si on arrondit toujours vers le haut, on accumule des erreurs d'arrondi positives. 

Avec l'arrondi vers le pair, la moitié du temps on arrondit vers le haut et 
l'autre moitié vers le bas, ce qui a tendance à annuler les erreurs d'arrondi 
sur un grand nombre de calculs.



L'arrondi au plus proche est la méthode d'arrondi par défaut pour les nombres à 
virgule flottante dans la norme IEEE 754, qui est la norme la plus couramment 
utilisée pour les calculs en virgule flottante dans les ordinateurs. 

L'arrondi au milieu est le comportement par défaut pour les opérations en virgule 
flottante dans le compilateur GCC.