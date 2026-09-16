from dataclasses import dataclass, field
from typing import Optional


@dataclass
class MainCharacter:
    """Classe d'un personnage principal"""
    id: Optional[str] = field(default=None, repr=False)
    first_name: Optional[str] = field(default=None, repr=False)
    last_name: Optional[str] = field(default=None, repr=False)

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"