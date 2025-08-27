import redis

def connect_redis():
    return redis.Redis(
        host="localhost",
        port=6379,
        decode_responses=True
    )

if __name__ == "__main__":
    r = connect_redis()
    print("Ping:", r.ping())