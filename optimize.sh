#!/bin/bash
# Cron SEO 优化脚本 - 每5分钟执行一次

WORKSPACE="/home/suibin/.openclaw/workspace/cron-generator"
LOG_FILE="$WORKSPACE/optimize.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始第$1轮优化" >> $LOG_FILE

# 第1轮：创建常见示例页面（cron every minute, every hour等）
if [ "$1" = "1" ]; then
    mkdir -p "$WORKSPACE/pages"
    
    # 创建 every-minute 页面
    cat > "$WORKSPACE/pages/every-minute.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Minute - Cron Expression Examples</title>
    <meta name="description" content="Learn how to run a cron job every minute. Complete guide with examples and explanations.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-minute.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Minute</h1>
        <p>To run a job every minute, use: <code>* * * * *</code></p>
        <h2>Explanation</h2>
        <ul>
            <li>First * = every minute (0-59)</li>
            <li>Second * = every hour (0-23)</li>
            <li>Third * = every day of month (1-31)</li>
            <li>Fourth * = every month (1-12)</li>
            <li>Fifth * = every day of week (0-6)</li>
        </ul>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
    echo "Created every-minute.html" >> $LOG_FILE
fi

# 第2轮：创建 every-hour 页面
if [ "$1" = "2" ]; then
    cat > "$WORKSPACE/pages/every-hour.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Hour - Cron Expression Examples</title>
    <meta name="description" content="Learn how to run a cron job every hour. Complete guide with examples.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-hour.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Hour</h1>
        <p>To run a job every hour, use: <code>0 * * * *</code></p>
        <h2>Explanation</h2>
        <ul>
            <li>0 = at minute 0</li>
            <li>* = every hour</li>
        </ul>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
    echo "Created every-hour.html" >> $LOG_FILE
fi

# 第3轮：创建 every-day 页面
if [ "$1" = "3" ]; then
    cat > "$WORKSPACE/pages/every-day.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Day - Daily Cron Job</title>
    <meta name="description" content="Learn how to run a cron job every day at a specific time.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-day.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Day</h1>
        <p>To run a job every day at midnight: <code>0 0 * * *</code></p>
        <p>To run at 9 AM daily: <code>0 9 * * *</code></p>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
    echo "Created every-day.html" >> $LOG_FILE
fi

# 第4轮：更新 sitemap
if [ "$1" = "4" ]; then
    cat > "$WORKSPACE/sitemap.xml" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>https://cron-generator.com/</loc>
        <changefreq>weekly</changefreq>
        <priority>1.0</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-minute.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-hour.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-day.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
</urlset>
EOF
    echo "Updated sitemap.xml" >> $LOG_FILE
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - 第$1轮优化完成" >> $LOG_FILE
