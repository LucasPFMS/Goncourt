# -*- coding: utf-8 -*-

from models.book import Book
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional


@dataclass
class BookDao(Dao[Book]):
    def create(self, book: Book) -> int:
        """Crée en BD l'entité Book correspondant au livre book"""
        try:
            cursor = Dao.connection.cursor()
            cursor.execute("INSERT INTO book VALUES(%s)", (book.title, book.summary,book.editor,book.publication_date,book.nb_pages, book.isbn,book.price))
            Dao.connection.commit()
            return cursor.lastrowid
        except Exception:
            Dao.connection.rollback()
        """

        :param book: à créer sous forme d'entité Book en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...
        return 0

    def read(self, b_id: int) -> Optional[Book]:
        """Renvoit le livre correspondant à l'entité dont l'id est b_id
           (ou None s'il n'a pu être trouvé)"""
        book: Optional[Book]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM book WHERE b_id=%s"
            cursor.execute(sql, (b_id,))
            record = cursor.fetchone()
        if record is not None:
            book = Book(record['b_title'], record['b_summary'], record['b_editor'], record['b_publication_date'], record['b_nb_pages'], record['b_isbn'], record['b_price'])
            book.id = record['b_id']
        else:
            book = None

        return book

    def update(self, book: Book) -> bool:
        """Met à jour en BD l'entité Book correspondant au livre, pour y correspondre

        :param book: livre déjà mis à jour en mémoire
        :return: True si la mise à jour a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("UPDATE book SET b_title = %s, b_summary = %s, b_editor = %s, b_publication_date = %s,"
                       "b_nb_pages=%s,b_isbn=%s,b_price=%s WHERE b_id = %s",)
        Dao.connection.commit()
        ...
        return True

    def delete(self, book: Book) -> bool:
        """Supprime en BD l'entité Book correspondant à book

        :param book: livre dont l'entité Book correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("DELETE FROM book WHERE b_id=%s")
        ...
        return True
