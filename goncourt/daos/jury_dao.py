from models.jury import Jury
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional


@dataclass
class JuryDao(Dao[Jury]):
    def create(self, jury: Jury) -> int:
        """Crée en BD l'entité Jury correspondant au jury jury"""
        try:
            cursor = Dao.connection.cursor()
            cursor.execute("INSERT INTO jury VALUES(%s)", (jury.is_president))
            Dao.connection.commit()
            return cursor.lastrowid
        except Exception:
            Dao.connection.rollback()
        """

        :param jury: à créer sous forme d'entité Jury en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...
        return 0

    def read(self, j_id: int)  -> Optional[Jury]:
        """Renvoit le jury correspondant à l'entité dont l'id est j_id
           (ou None s'il n'a pu être trouvé)"""
        jury: Optional[Jury]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM jury WHERE j_id=%s"
            cursor.execute(sql, (j_id,))
            record = cursor.fetchone()
        if record is not None:
            Jury(record['j_is_president'])
            jury = record['j_id']
        else:
            jury = None

        return jury

    def update(self, jury: Jury)  -> bool:
        """Met à jour en BD l'entité Jury correspondant à jury, pour y correspondre

        :param jury: jury déjà mis à jour en mémoire
        :return: True si la mise à jour a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("UPDATE jury SET j_is_president = %s")
        Dao.connection.commit()
        ...
        return True

    def delete(self, jury: Jury)  -> bool:
        """Supprime en BD l'entité Jury correspondant à jury

        :param jury: jury dont l'entité Jury correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("DELETE FROM jury WHERE j_id=%s")
        ...
        return True
