# Start from the official PostgreSQL image
FROM ankane/pgvector:latest

# Install pg_cron and pgvector extensions
RUN apt-get update && apt-get install -y \
    postgresql-15-cron \
    postgresql-15-pgvector \
    && rm -rf /var/lib/apt/lists/*

ENV POSTGRES_PASSWORD=password

# Enable pg_cron by adding it to shared_preload_libraries
RUN echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample
