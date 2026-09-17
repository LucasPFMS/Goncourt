# -*- coding: utf-8 -*-
from models.main_character import MainCharacter
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional


@dataclass
class MainCharacterDAO(Dao[MainCharacter]):
    def create(self, main_character: MainCharacter) -> int:
        """Crée en BD l'entité MainCharacter correspondant au personnage main_character"""
        try:
            cursor = Dao.connection.cursor()
            cursor.execute("INSERT INTO main_character VALUES(%s)", (main_character.mc_first_name, main_character.mc_last_name))
            Dao.connection.commit()
            return cursor.lastrowid
        except Exception:
            Dao.connection.rollback()
        """

        :param main_character: à créer sous forme d'entité MainCharacter en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        ...
        return 0

    def read(self, m_id: int) -> Optional[MainCharacter]:
        """Renvoit le personnage correspondant à l'entité dont l'id est m_id
           (ou None s'il n'a pu être trouvé)"""
        main_character: Optional[MainCharacter]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM main_character WHERE m_id=%s"
            cursor.execute(sql, (m_id,))
            record = cursor.fetchone()
        if record is not None:
            main_character = MainCharacter(record['m_first_name'], record['m_last_name'])
            main_character.id = record['m_id']
        else:
            main_character = None

        return main_character

    def update(self, main_character: MainCharacter) -> bool:
        """Met à jour en BD l'entité MainCharacter correspondant à main_character, pour y correspondre

        :param main_character: personnage déjà mis à jour en mémoire
        :return: True si la mise à jour a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("UPDATE main_character SET m_first_name = %s, m_last_name = %s WHERE m_id = %s",)
        Dao.connection.commit()
        ...
        return True

    def delete(self, main_character: MainCharacter) -> bool:
        """Supprime en BD l'entité MainCharacter correspondant à main_character

        :param main_character: personnage dont l'entité MainCharacter correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        cursor = Dao.connection.cursor()
        cursor.execute("DELETE FROM main_character WHERE m_id=%s")
        ...
        return True
