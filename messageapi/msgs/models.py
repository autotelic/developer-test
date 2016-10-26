"""Models."""
from __future__ import unicode_literals

from django.db import models


class Message(models.Model):
    """Models."""

    def __str__(self):
        """String representation."""
        return u'{} - {}'.format(
            self.created_at,
            self.author
        )

    text = models.TextField(null=False)
    author = models.CharField(max_length=255)
    in_reply_to = models.IntegerField(null=True)
    utc_offset = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
