import redis

def connect_redis():
    return redis.Redis(
        host="localhost",
        port=6379,
        decode_responses=True
    )


def add_user(r):
    user_id = input("Podaj ID użytkownika: ")
    name = input("Podaj imię i nazwisko: ")
    email = input("Podaj email: ")
    # Redis Hash
    r.hset(f"user:{user_id}", mapping={"name": name, "email": email})
    print("Użytkownik dodany!")


def main():
    r = connect_redis()
    print("Połączono z Redisem!")

    while True:
        print("\n--- MENU ---")
        print("1. Dodaj użytkownika")

        choice = input("Wybierz opcję: ")

        if choice == "1":
            add_user(r)
        else:
            print("Nieprawidłowa opcja.")


if __name__ == "__main__":
    r = connect_redis()
    print("Ping:", r.ping())