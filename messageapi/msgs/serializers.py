"""DRF Serializers."""
from messageapi.msgs.models import Message
from rest_framework import serializers

class MessageSerializer(serializers.HyperlinkedModelSerializer):
    """Message Serializer."""

    url = serializers.HyperlinkedIdentityField(view_name='message-detail')

    class Meta:
        """Meta."""

        model = Message
        fields = (
            'id',
            'text',
            'url',
            'created_at'
        )


class MessageDetailSerializer(serializers.HyperlinkedModelSerializer):
    """Message Serializer."""

    class Meta:
        """Meta."""

        model = Message
        fields = (
            'id',
            'text',
            'author',
            'in_reply_to',
            'utc_offset',
            'created_at',
            'updated_at'
        )
