const assert = require('node:assert/strict');
const { after, before, test } = require('node:test');
const app = require('../src/app');

let server;
let baseUrl;

before(async () => {
  server = app.listen(0, '127.0.0.1');
  await new Promise((resolve) => server.once('listening', resolve));
  baseUrl = `http://127.0.0.1:${server.address().port}`;
});

after(async () => {
  await new Promise((resolve, reject) => {
    server.close((error) => (error ? reject(error) : resolve()));
  });
});

test('GET /health returns a timestamped healthy response', async () => {
  const response = await fetch(`${baseUrl}/health`);
  const body = await response.json();

  assert.equal(response.status, 200);
  assert.equal(body.status, 'ok');
  assert.ok(!Number.isNaN(Date.parse(body.timestamp)));
});

test('liveness and readiness endpoints return successful status', async () => {
  for (const [path, status] of [
    ['/health/live', 'ok'],
    ['/health/ready', 'ready'],
  ]) {
    const response = await fetch(`${baseUrl}${path}`);
    assert.equal(response.status, 200);
    assert.equal((await response.json()).status, status);
  }
});

test('GET /metrics exposes Prometheus process metrics', async () => {
  const response = await fetch(`${baseUrl}/metrics`);
  const body = await response.text();

  assert.equal(response.status, 200);
  assert.match(response.headers.get('content-type'), /text\/plain/);
  assert.match(body, /process_uptime_seconds \d/);
  assert.match(body, /process_resident_memory_bytes \d/);
});
