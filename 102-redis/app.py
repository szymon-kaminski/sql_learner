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


def get_user(r):
    user_id = input("Podaj ID użytkownika: ")
    user = r.hgetall(f"user:{user_id}")
    if user:
        print(f"Użytkownik {user_id}: {user}")
    else:
        print("Nie znaleziono użytkownika.")


def list_users(r):
    keys = r.keys("user:*")
    if not keys:
        print("Brak użytkowników w bazie.")
        return
    for key in keys:
        user = r.hgetall(key)
        print(f"{key} -> {user}")


def delete_user(r):
    user_id = input("Podaj ID użytkownika do usunięcia: ")
    if r.delete(f"user:{user_id}"):
        print("Użytkownik usunięty.")
    else:
        print("Nie znaleziono użytkownika.")


def export_users(r):
    keys = r.keys("user:*")
    data = {key: r.hgetall(key) for key in keys}
    with open("users.json", "w") as f:
        json.dump(data, f, indent=4)
    print("Wyeksportowano do users.json")


def main():
    r = connect_redis()
    print("Połączono z Redisem!")

    while True:
        print("\n--- MENU ---")
        print("1. Dodaj użytkownika")
        print("2. Pobierz użytkownika")
        print("3. Lista wszystkich użytkowników")
        print("4. Usuń użytkownika")
        print("5. Export do JSON")
        print("6. Wyjście")

        choice = input("Wybierz opcję: ")

        if choice == "1":
            add_user(r)
        elif choice == "2":
            get_user(r)
        elif choice == "3":
            list_users(r)
        elif choice == "4":
            delete_user(r)
        elif choice == "5":
            export_users(r)
        elif choice == "6":
            print("Zakończono.")
            break
        else:
            print("Nieprawidłowa opcja.")


if __name__ == "__main__":
    main()