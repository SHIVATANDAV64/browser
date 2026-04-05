# Lightpanda on Render (for Playwright MCP)

This setup deploys Lightpanda as a Render web service and exposes its CDP endpoint.

## 1) Deploy on Render

1. Push this repository to GitHub.
2. In Render, create a new Blueprint service from this repo.
3. Render will detect `render.yaml` and create the `lightpanda-cdp` service.

## 2) Verify CDP server

After deploy is healthy, open:

- `https://<your-render-service>.onrender.com/json/version`

If it returns JSON, CDP is live.

## 3) Connect Playwright MCP to Render-hosted Lightpanda

Use this MCP server configuration in your local MCP client:

```json
{
  "mcpServers": {
    "playwright-lightpanda": {
      "command": "npx",
      "args": [
        "-y",
        "@playwright/mcp@latest",
        "--cdp-endpoint",
        "https://<your-render-service>.onrender.com"
      ]
    }
  }
}
```

## Notes for Render Free

- Free web services spin down after idle periods.
- First request after spin-down can take around a minute.
- Filesystem is ephemeral.
- This is suitable for testing/hobby use, not always-on production automation.

