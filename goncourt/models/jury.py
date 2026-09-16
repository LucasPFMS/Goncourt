from dataclasses import dataclass, field
from typing import Optional
from .author import Author


@dataclass
class Jury(Author):
    """Classe d'un  membre du Jury"""
    id: Optional[int] = field(default=None, repr=False)
    is_president: Optional[bool] = field(default=None, repr=False)

    def __str__(self) -> str:
        return f"{self.a_first_name} {self.a_last_name} {self.is_president}"
