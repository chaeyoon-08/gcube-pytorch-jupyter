# gcube-pytorch-jupyter

PyTorch + JupyterLab Docker image, auto-built and published to GHCR for deployment on gcube.

## Image

- Base: `pytorch/pytorch:2.7.0-cuda12.8-cudnn9-runtime`
- Extras: `jupyterlab`, `numpy`, `pandas`, `matplotlib`, `transformers`, `datasets`
- Workdir: `/workspace`
- Exposes: `8888`
- Entrypoint: JupyterLab on `0.0.0.0:8888`. Token is taken from `JUPYTER_TOKEN` env var; if unset, JupyterLab starts with no token.

Pull:

```bash
docker pull ghcr.io/chaeyoon-08/gcube-pytorch-jupyter:latest
```

Run locally:

```bash
docker run --rm -p 8888:8888 -e JUPYTER_TOKEN=mytoken \
  ghcr.io/chaeyoon-08/gcube-pytorch-jupyter:latest
```

## CI

`.github/workflows/build.yml` builds the image on every push to `main` and pushes `:latest` plus a `:${sha}` tag to `ghcr.io/chaeyoon-08/gcube-pytorch-jupyter`.

## gcube deployment

`workload.yaml` defines a gcube workload using this image (port 8888, RTX3070 Tier 3, CUDA 12.8, 4 GiB shared memory).

```bash
gcube workload register -f workload.yaml
gcube workload start <ser>
gcube workload describe <ser>
```
