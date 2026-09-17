from models.author import Author
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional


@dataclass
class AuthorDao(Dao[Author]):
    def create(self, author: Author) -> int:
        """Crée en BD l'entité Author correspondant à l'auteur author"""
        try:
            cursor = Dao.connection.cursor()
            cursor.execute("INSERT INTO author VALUES(%s)", (author.a_first_name, author.a_last_name, author.biography))
            Dao.connection.commit()
            return cursor.lastrowid
        except Exception:
            Dao.connection.rollback()
        """

        :param author: à créer sous forme d'entité Author en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...
        return 0

    def read(self, a_id: int) -> Optional[Author]:
        """Renvoit l'auteur correspondant à l'entité dont l'id est a_id
           (ou None s'il n'a pu être trouvé)"""
        author: Optional[Author]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM author WHERE a_id=%s"
            cursor.execute(sql, (a_id,))
            record = cursor.fetchone()
        if record is not None:
            author = Author(record['a_first_name'], record['a_last_name'], record['a_biography'])
            author.id = record['a_id']
        else:
            author = None

        return author

    def update(self, author: Author) -> bool:
        """Met à jour en BD l'entité Author correspondant à author, pour y correspondre

        :param author: auteur déjà mis à jour en mémoire
        :return: True si la mise à jour a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("UPDATE author SET a_first_name = %s, a_last_name = %s, a_biography = %s WHERE a_id = %s",)
        Dao.connection.commit()
        ...
        return True

    def delete(self,  author: Author) -> bool:
        """Supprime en BD l'entité Author correspondant à author

        :param author: auteur dont l'entité Author correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("DELETE FROM author WHERE a_id=%s")
        ...
        return True
