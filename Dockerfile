FROM python:3.11

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 - &&     export PATH="$HOME/.local/bin:$PATH"

# Create a working directory
RUN mkdir /pdf && chmod 777 /pdf

WORKDIR /ILovePDF

# Copy the project files
COPY ILovePDF /ILovePDF

# Use Poetry to install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-root

# Install additional dependencies
RUN apt update && apt install -y ocrmypdf wkhtmltopdf tree

CMD ["bash", "run.sh"]
