from messageapi.msgs.models import Message
from rest_framework import viewsets
from messageapi.msgs.serializers import MessageSerializer, MessageDetailSerializer


class MessageViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Message.objects.all()

    def get_serializer_class(self):
        if self.action == 'retrieve':
            return MessageDetailSerializer
        return MessageSerializer
