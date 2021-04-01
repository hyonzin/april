from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view

__all__ = [
    'get_test',
]


@api_view(['GET'])
def get_test(request):
    data = {
        "name": "test",
        "state": "good",
    }
    return Response(data=data, status=status.HTTP_200_OK)

