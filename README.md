# gcube-pytorch-jupyter

gcube + Claude Code 연계 PyTorch JupyterLab 환경

## 구성

- **Base Image**: `pytorch/pytorch:2.7.0-cuda12.8-cudnn9-runtime`
- **Python 패키지**: JupyterLab, NumPy, Pandas, Matplotlib, Transformers, Datasets
- **포트**: 8888 (JupyterLab)

## 빌드

GitHub Actions가 `main` 브랜치 push 시 자동으로 Docker 이미지를 빌드하여 ghcr.io에 푸시합니다.

```
ghcr.io/chaeyoon-08/gcube-pytorch-jupyter:latest
```

## gcube 배포

```bash
gcube workload register -f workload.yaml
gcube workload start <SER>
```

## 환경변수

| 변수 | 설명 |
|------|------|
| `JUPYTER_TOKEN` | JupyterLab 접속 토큰 (미설정 시 토큰 없이 접속) |
