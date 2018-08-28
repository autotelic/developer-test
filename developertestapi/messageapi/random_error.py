from django.http import HttpResponse
from random import random

class RandomError(object):

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):

        if random() <= 0.08:
            return HttpResponse(status=500)

        response = self.get_response(request)

        return response
