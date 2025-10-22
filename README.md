# SchemaSpy Docker for Informix

**SchemaSpy Docker for Informix** is a Docker-based project designed to generate documentation for **Informix databases** using [SchemaSpy](https://schemaspy.org/).
It simplifies connecting to, analyzing, and visualizing the structure of an Informix database — all inside a lightweight, dependency-free container.

---

## 🧩 Features

* **Automatic documentation**: Generates full HTML reports of the database structure, relationships, and keys.
* **Docker-based execution**: Everything runs in an isolated, reproducible container environment.
* **Native Informix connection**: Uses the Informix JDBC driver for direct connections.
* **Web output**: Produces browsable documentation (`index.html`).
* **Flexible configuration**: All parameters are customizable via `.env` files and property templates.
* **Multi-database support**:
  The project is designed to handle **multiple Informix databases** easily.
  Just copy one existing database directory and rename it, e.g.:

  ```
  db/
  ├── db-analytics/
  ├── db-inventory/
  ├── db-customers/
  ```

  Each database folder can have its own `.env`, `output/`, and configuration.
  This allows you to generate documentation for multiple databases independently.

---

## 🚀 Installation and Usage

1. **Clone the repository**

   ```bash
   git clone https://github.com/rwxce/schemaspy-informix.git
   cd schemaspy-informix
   ```

2. **Make sure Docker is running**

   Ensure both Docker and Docker Compose are installed and active.

3. **Create your `.env` file**

   Copy the example file and edit your connection details:

   ```bash
   cp ./db/db-analytics/env/.env.example ./db/db-analytics/env/.env
   ```

   Available variables:

   ```
   INFORMIX_HOST=
   INFORMIX_PORT=
   INFORMIX_SERVER=
   INFORMIX_DBNAME=
   INFORMIX_USER=
   INFORMIX_PASSWORD=
   ```

4. **Download the Informix JDBC driver**

   Go to:
   🔗 [https://repo1.maven.org/maven2/com/ibm/informix/jdbc/](https://repo1.maven.org/maven2/com/ibm/informix/jdbc)

   * Find the **latest compatible version** for your Informix setup.
   * Download the `.jar` file.
   * Place it inside:

     ```
     ./drivers/
     ```

5. **Run SchemaSpy**

   ```bash
   docker compose up
   ```

6. **View the generated documentation**

   After execution, open:

   ```
   ./db/db-analytics/output/index.html
   ```

---

## ⚙️ Additional Configuration

* You can modify `schemaspy.properties.template` to adjust JDBC parameters, output path, or advanced settings.
* The container automatically replaces environment variables using `envsubst` before running SchemaSpy.

---

## 🧾 License

This project is licensed under the **MIT License**.
See the [LICENSE](LICENSE) file for more details.

---

## 📬 Contact

For questions or suggestions, contact:
**[148581386+rwxce@users.noreply.github.com](mailto:148581386+rwxce@users.noreply.github.com)**