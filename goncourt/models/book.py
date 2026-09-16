from dataclasses import dataclass, field
from typing import Optional
from .author import Author


@dataclass
class Book(Author):
    """Classe d'un livre"""
    id: Optional[int] = field(default=None, repr=False)
    title: Optional[str] = field(default=None, repr=False)
    summary: Optional[str] = field(default=None, repr=False)
    editor: Optional[str] = field(default=None, repr=False)
    publication_date: Optional[str] = field(default=None, repr=False)
    nb_pages: Optional[int] = field(default=None, repr=False)
    isbn: Optional[str] = field(default=None, repr=False)
    price: Optional[float] = field(default=None, repr=False)

    def __str__(self) -> str:
        return (f'{self.first_name} {self.last_name} {self.title}{self.nb_pages}{self.isbn}{str(self.price)}'
                f'{str(self.editor)}{str(self.publication_date)}{self.summary}')
