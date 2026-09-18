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
    second_selection = []
    third_selection = []
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
            while i <= 8:
                for book in goncourt.books:
                    id_chose = int(input())
                    if book.id == id_chose:
                        second_selection.append(goncourt.get_book_by_id(id_chose))
                        i += 1

    print("Qui êtes vous ? (utilisateur/president")
    is_president = input()
    if is_president == "utilisateur":
        # affichage de la liste des livres
        goncourt.display_books_list()
        print("deuxième sélection:")
        print(second_selection)

    else:
        if is_president == "president":
            print("voici la liste des livres, choisi l'id des 4 de la troisième sélection")
            print(second_selection)
            i = 1
            while i <= 4:
                for book in second_selection:
                    id_chose = int(input())
                    if book.id == id_chose:
                        third_selection.append(goncourt.get_book_by_id(id_chose))
                        i += 1
    print("Qui êtes vous ? (utilisateur/president")
    is_president = input()
    if is_president == "utilisateur":
        # affichage de la liste des livres
        goncourt.display_books_list()
        print("deuxième sélection:")
        print(second_selection)
        print("troisième sélection:")
        print(third_selection)
    else:
        if is_president == "president":
            print("voici la liste des livres, choisis le nombre de votes puis choisi le gagnant")
            print(third_selection)
            for book in third_selection:
                id_chose = int(input())
                if book.id == id_chose:
                    print("voici le gagnant")
                    print(book.title)
                    


    # affichage de la liste des cours, leur enseignant et leurs élèves


if __name__ == '__main__':
    main()
