const express = require('express');

const router = express.Router();

router.get('/health', (_request, response) => {
  response.json({
    status: 'ok',
    timestamp: new Date().toISOString(),
  });
});

router.get('/health/live', (_request, response) => {
  response.status(200).json({ status: 'ok' });
});

router.get('/health/ready', (_request, response) => {
  response.status(200).json({ status: 'ready' });
});

router.get('/metrics', (_request, response) => {
  const memory = process.memoryUsage();
  response
    .type('text/plain; version=0.0.4; charset=utf-8')
    .send([
      '# HELP process_uptime_seconds Process uptime in seconds.',
      '# TYPE process_uptime_seconds gauge',
      `process_uptime_seconds ${process.uptime()}`,
      '# HELP process_resident_memory_bytes Resident memory size in bytes.',
      '# TYPE process_resident_memory_bytes gauge',
      `process_resident_memory_bytes ${memory.rss}`,
      '# HELP nodejs_heap_used_bytes Node.js heap used in bytes.',
      '# TYPE nodejs_heap_used_bytes gauge',
      `nodejs_heap_used_bytes ${memory.heapUsed}`,
      '',
    ].join('\n'));
});

module.exports = router;
