from dataclasses import dataclass, field
from typing import Optional
from .book import Book
from .main_character import MainCharacter


@dataclass
class include(Book, MainCharacter):
    """Classe de jointure entre livre et personnage principal"""

    def __str__(self):
        return f'{self.mc_first_name} {self.mc_last_name}{self.title}'
