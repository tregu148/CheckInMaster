FROM python:3.12

WORKDIR /app
COPY requirements.txt /app
COPY app.py /app
RUN pip install --no-cache-dir --upgrade -r requirements.txt

ENV MPLCONFIGDIR /app/matplotlib_cache

# 新しいユーザーを作成
RUN adduser --disabled-password --gecos '' myuser

# flagged ディレクトリを作成し、新しいユーザーに所有権を与える
RUN mkdir /app/flagged && chown -R myuser:myuser /app/flagged

# アプリケーションを実行するユーザーを切り替える
USER myuser

CMD ["python", "app.py"]