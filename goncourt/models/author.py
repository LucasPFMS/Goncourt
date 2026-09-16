from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Author:
    """Classe d'un auteur"""
    id: Optional[int] = field(default=None, init=False)
    a_first_name: Optional[str] = field(default=None, init=False)
    a_last_name: Optional[str] = field(default=None, init=False)
    biography: Optional[str] = field(default=None, init=False)

    def __str__(self) -> str:
        return f"{self.a_first_name} {self.a_last_name} {self.biography}"
