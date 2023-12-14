FROM python:3.12

WORKDIR /app
COPY requirements.txt /app
COPY app.py /app
RUN pip install --no-cache-dir --upgrade -r requirements.txt

ENV MPLCONFIGDIR /app/matplotlib_cache

# 新しいユーザーを作成
RUN adduser --disabled-password --gecos '' myuser

# /app ディレクトリに新しいユーザーに所有権を与える
RUN chown -R myuser:myuser /app

# アプリケーションを実行するユーザーを切り替える
USER myuser
EXPOSE 7860

CMD ["python", "app.py"]