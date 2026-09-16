from dataclasses import dataclass, field
from typing import Optional


@dataclass
class MainCharacter:
    """Classe d'un personnage principal"""
    id: Optional[str] = field(default=None, repr=False)
    mc_first_name: Optional[str] = field(default=None, repr=False)
    mc_last_name: Optional[str] = field(default=None, repr=False)

    def __str__(self) -> str:
        return f"{self.mc_first_name} {self.mc_last_name}"