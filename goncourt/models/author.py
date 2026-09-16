from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Author:
    """Classe d'un auteur"""
    id: Optional[int] = field(default=None, init=False)
    first_name: Optional[str] = field(default=None, init=False)
    last_name: Optional[str] = field(default=None, init=False)
    biography: Optional[str] = field(default=None, init=False)

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name} {self.biography}"
