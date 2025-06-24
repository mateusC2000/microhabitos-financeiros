FROM ruby:3.3.5

# Instala dependências
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configura o diretório da app
WORKDIR /app

# Copia arquivos necessários
COPY Gemfile* ./
RUN bundle install

COPY . .

# Expõe a porta do Rails
EXPOSE 3000
