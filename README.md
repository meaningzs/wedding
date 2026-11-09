# wedding

## 서버 운영

이 저장소는 빌드 과정이 없는 **정적 파일** 저장소입니다. nginx(Docker) 또는 python3 내장 서버로 서빙합니다.
현재 `index.html` 이 없으므로 `/` 에서는 파일 목록이 표시됩니다.

### Docker Compose (권장)

```bash
docker compose up -d --build        # http://localhost:8080
PORT=80 docker compose up -d --build  # 호스트 포트 변경
```

### Docker 단독

```bash
docker build -t wedding-web .
docker run -d -p 8080:8080 --name wedding-web wedding-web
```

- 컨테이너 내부 포트: `8080`
- 헬스체크: `GET /healthz` → `200 ok` (Dockerfile `HEALTHCHECK` 에 등록됨)

### Docker 없이 실행

```bash
./serve.sh                 # 기본 0.0.0.0:8080
PORT=3000 ./serve.sh       # 포트 변경
```

python3 의 `http.server` 를 사용합니다(`/healthz` 엔드포인트는 없음). 운영 환경에서는 Docker(nginx) 사용을 권장합니다.

### 비밀값

현재 필요한 환경변수/API 키는 없습니다. 추후 필요해지면 `.env` 파일(커밋 금지, `.dockerignore` 에 포함)이나 환경변수로 주입하세요.
