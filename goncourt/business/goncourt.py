# -*- coding: utf-8 -*-

"""
Classe School
"""

from dataclasses import dataclass, field
from datetime import date
from typing import Optional

from daos.book_dao import BookDao
from daos.jury_dao import JuryDao
from daos.main_character_dao import MainCharacterDAO
from daos.author_dao import AuthorDao
from models.book import Book
from models.author import Author
from models.jury import Jury
from models.main_character import MainCharacter
from models.include import include


@dataclass
class Goncourt:
    """Couche métier de l'application de gestion du prix Goncourt,
    reprenant les cas d'utilisation et les spécifications fonctionnelles :
    - books : liste des livres
    - jurys : liste des jurys
    - main_characters : liste des personnages principaux
    - authors : liste des auteurs"""

    books: list[Book] = field(default_factory=list, init=False)
    authors: list[Author] = field(default_factory=list, init=False)
    jurys: list[Jury] = field(default_factory=list, init=False)
    main_characters: list[MainCharacter] = field(default_factory=list, init=False)

    def add_books(self, book: Book) -> None:
        """Ajout du livre book à la liste des livres."""
        self.books.append(book)

    def add_jury(self, jury: Jury) -> None:
        """Ajout du jury jury à la liste des jurys."""
        self.jurys.append(jury)

    def add_author(self, author: Author) -> None:
        """Ajout de l'auteur à la liste des auteurs."""
        self.authors.append(author)

    def add_main_character(self, main_character: MainCharacter) -> None:
        """Ajout du personnage à la liste des personnages."""
        self.main_characters.append(main_character)

    def display_books_list(self) -> None:
        """Affichage de la liste des livres avec pour chacun d'eux leur infos"""
        for book in self.books:
            print(f"{book}")
            print()

    @staticmethod
    def get_author_by_id(id_author: int) -> Optional[Author]:
        author_dao: AuthorDao = AuthorDao()
        return author_dao.read(id_author)

    @staticmethod
    def get_book_by_id(id_book: int) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book)
