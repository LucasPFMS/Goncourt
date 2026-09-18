#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Application de gestion du prix Goncourt
"""
from business import goncourt
from business.goncourt import Goncourt
from models.book import Book


def main() -> None:
    """Programme principal."""
    print("""\
-------------------------------------------
Bienvenue pour le résultat du prix Goncourt
--------------------------------------------""")

    goncourt: Goncourt = Goncourt()

    # demande si il s'agit  du président ou d'un simple utilisateur
    print("Qui êtes vous ? (utilisateur/president")
    is_president = input()
    if is_president == "utilisateur":
        # affichage de la liste des livres
        goncourt.display_books_list()

    else:
        if is_president == "president":
            print("voici la liste des livres, choisi l'id des 8 de la deuxième sélection")
            goncourt.display_books_list()
            i = 1
            second_selection = []
            while i <= 8:
                for book in goncourt.books:
                    id_chose = int(input())
                    if book.id == id_chose:
                        second_selection.append(goncourt.get_book_by_id(id_chose))
                        i += 1



    # affichage de la liste des cours, leur enseignant et leurs élèves


if __name__ == '__main__':
    main()
