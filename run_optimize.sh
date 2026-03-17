#!/bin/bash
# Cron SEO 优化主脚本 - 检查并执行下一轮优化

WORKSPACE="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$WORKSPACE/optimize.log"
STATE_FILE="$WORKSPACE/.optimize_state"

# 获取当前轮次
CURRENT_ROUND=1
if [ -f "$STATE_FILE" ]; then
    CURRENT_ROUND=$(cat "$STATE_FILE")
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始第$CURRENT_ROUND轮优化" >> $LOG_FILE

case $CURRENT_ROUND in
    1)
        # 创建常见示例页面
        mkdir -p "$WORKSPACE/pages"
        
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
        <div class="examples">
            <h3>Common Variations</h3>
            <ul>
                <li><code>*/5 * * * *</code> - Every 5 minutes</li>
                <li><code>*/10 * * * *</code> - Every 10 minutes</li>
                <li><code>*/15 * * * *</code> - Every 15 minutes</li>
            </ul>
        </div>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 every-minute.html" >> $LOG_FILE
        ;;
        
    2)
        # 创建 every-hour 页面
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
        <p>To run a job every hour at minute 0, use: <code>0 * * * *</code></p>
        <h2>Explanation</h2>
        <ul>
            <li>0 = at minute 0</li>
            <li>* = every hour (0-23)</li>
            <li>* = every day of month</li>
            <li>* = every month</li>
            <li>* = every day of week</li>
        </ul>
        <div class="examples">
            <h3>Hourly Variations</h3>
            <ul>
                <li><code>0 * * * *</code> - Every hour at minute 0</li>
                <li><code>30 * * * *</code> - Every hour at minute 30</li>
                <li><code>*/2 * * * *</code> - Every 2 hours</li>
                <li><code>*/4 * * * *</code> - Every 4 hours</li>
                <li><code>0 */6 * * *</code> - Every 6 hours</li>
            </ul>
        </div>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 every-hour.html" >> $LOG_FILE
        ;;
        
    3)
        # 创建 every-day 页面
        cat > "$WORKSPACE/pages/every-day.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Day - Daily Cron Job</title>
    <meta name="description" content="Learn how to run a cron job every day at a specific time. Examples for midnight, morning, evening.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-day.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Day</h1>
        <p>Run a job daily at a specific time:</p>
        <ul>
            <li><code>0 0 * * *</code> - Every day at midnight</li>
            <li><code>0 9 * * *</code> - Every day at 9 AM</li>
            <li><code>0 12 * * *</code> - Every day at noon</li>
            <li><code>0 18 * * *</code> - Every day at 6 PM</li>
        </ul>
        <h2>Format Explanation</h2>
        <p>minute hour * * *</p>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 every-day.html" >> $LOG_FILE
        ;;
        
    4)
        # 创建 every-week 页面
        mkdir -p "$WORKSPACE/pages"
        cat > "$WORKSPACE/pages/every-week.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Week - Weekly Cron Job</title>
    <meta name="description" content="Learn how to run a cron job every week on specific days.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-week.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Week</h1>
        <ul>
            <li><code>0 0 * * 0</code> - Every Sunday at midnight</li>
            <li><code>0 9 * * 1</code> - Every Monday at 9 AM</li>
            <li><code>0 9 * * 1-5</code> - Weekdays at 9 AM</li>
            <li><code>0 9 * * 1,3,5</code> - Mon, Wed, Fri at 9 AM</li>
            <li><code>0 0 * * 0,6</code> - Weekends at midnight</li>
        </ul>
        <h2>Day of Week: 0=Sunday, 6=Saturday</h2>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 every-week.html" >> $LOG_FILE
        ;;
        
    5)
        # 创建 every-month 页面
        cat > "$WORKSPACE/pages/every-month.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Run Cron Every Month - Monthly Cron Job</title>
    <meta name="description" content="Learn how to run a cron job every month on a specific day.">
    <link rel="canonical" href="https://cron-generator.com/pages/every-month.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Run Cron Every Month</h1>
        <ul>
            <li><code>0 0 1 * *</code> - First day of every month</li>
            <li><code>0 0 15 * *</code> - 15th of every month</li>
            <li><code>0 0 1,15 * *</code> - 1st and 15th of month</li>
            <li><code>0 0 L * *</code> - Last day of month</li>
        </ul>
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 every-month.html" >> $LOG_FILE
        ;;
        
    6)
        # 更新 sitemap 添加所有新页面
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
    <url>
        <loc>https://cron-generator.com/pages/every-week.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-month.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
</urlset>
EOF
        echo "✓ 更新 sitemap.xml" >> $LOG_FILE
        ;;
        
    7)
        # 创建 cron-expression-format 页面
        cat > "$WORKSPACE/pages/cron-expression-format.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cron Expression Format - Complete Guide</title>
    <meta name="description" content="Complete guide to cron expression format. Learn the 5 fields and their valid values.">
    <link rel="canonical" href="https://cron-generator.com/pages/cron-expression-format.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Cron Expression Format</h1>
        <p>A cron expression has 5 fields: <code>minute hour day month weekday</code></p>
        
        <h2>Field Ranges</h2>
        <ul>
            <li><strong>Minute:</strong> 0-59</li>
            <li><strong>Hour:</strong> 0-23</li>
            <li><strong>Day:</strong> 1-31</li>
            <li><strong>Month:</strong> 1-12</li>
            <li><strong>Weekday:</strong> 0-6 (0=Sunday)</li>
        </ul>
        
        <h2>Special Characters</h2>
        <ul>
            <li><code>*</code> - Any value</li>
            <li><code>,</code> - Value list separator (1,3,5)</li>
            <li><code>-</code> - Range of values (1-5)</li>
            <li><code>/</code> - Step values (*/5)</li>
        </ul>
        
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 cron-expression-format.html" >> $LOG_FILE
        ;;
        
    8)
        # 创建 crontab-syntax 页面
        cat > "$WORKSPACE/pages/crontab-syntax.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Crontab Syntax - Examples and Tutorial</title>
    <meta name="description" content="Learn crontab syntax with practical examples. How to write crontab entries.">
    <link rel="canonical" href="https://cron-generator.com/pages/crontab-syntax.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Crontab Syntax</h1>
        <p>Basic crontab line format:</p>
        <code>* * * * * command</code>
        
        <h2>Examples</h2>
        <ul>
            <li><code>*/15 * * * * /script.sh</code> - Run every 15 min</li>
            <li><code>0 5 * * * /backup.sh</code> - Daily 5 AM backup</li>
            <li><code>0 0 * * 0 /weekly.sh</code> - Weekly Sunday</li>
        </ul>
        
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 crontab-syntax.html" >> $LOG_FILE
        ;;
        
    9)
        # 在首页添加更多下拉选项和内链
        cat >> "$WORKSPACE/style.css" << 'EOF'

/* Additional pages link section */
.pages-nav {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin: 2rem 0;
}

.pages-nav a {
    padding: 1rem;
    background: #f8fafc;
    border-radius: 8px;
    text-decoration: none;
    color: #2563eb;
    transition: background 0.2s;
}

.pages-nav a:hover {
    background: #e2e8f0;
}
EOF
        echo "✓ 更新 style.css 添加页面导航样式" >> $LOG_FILE
        ;;
        
    10)
        # 创建首页的内链区块
        # 备份原首页
        cp "$WORKSPACE/index.html" "$WORKSPACE/index.html.bak"
        
        # 创建一个新的带内链的首页
        cat > "$WORKSPACE/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cron Expression Generator - Free Online Cron Job Scheduler</title>
    <meta name="description" content="Free online cron expression generator. Create valid cron jobs with easy-to-use interface. Supports standard 5-field cron format. Preview next execution times instantly.">
    <meta name="keywords" content="cron expression, cron generator, cron job, crontab, cron scheduler, online cron">
    <link rel="canonical" href="https://cron-generator.com/">
    <link rel="stylesheet" href="style.css">
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "WebApplication",
        "name": "Cron Expression Generator",
        "description": "Free online cron expression generator with visual interface",
        "url": "https://cron-generator.com/",
        "applicationCategory": "DeveloperTools"
    }
    </script>
</head>
<body>
    <header>
        <nav>
            <a href="/" class="logo">Cron Generator</a>
        </nav>
    </header>

    <main>
        <section class="hero">
            <h1>Cron Expression Generator</h1>
            <h2>Generate Valid Cron Expressions in Seconds</h2>
            <p>Free online tool to create and validate cron job schedules. Supports standard 5-field cron format.</p>
        </section>

        <section class="generator">
            <div class="field">
                <label for="minute">Minute (0-59)</label>
                <select id="minute">
                    <option value="*">Every minute (*)</option>
                    <option value="0">At minute 0</option>
                    <option value="*/5">Every 5 minutes (*/5)</option>
                    <option value="*/10">Every 10 minutes (*/10)</option>
                    <option value="*/15">Every 15 minutes (*/15)</option>
                    <option value="*/30">Every 30 minutes (*/30)</option>
                </select>
            </div>

            <div class="field">
                <label for="hour">Hour (0-23)</label>
                <select id="hour">
                    <option value="*">Every hour (*)</option>
                    <option value="0">At midnight (0)</option>
                    <option value="9">At 9 AM</option>
                    <option value="12">At noon (12)</option>
                    <option value="18">At 6 PM (18)</option>
                    <option value="*/2">Every 2 hours (*/2)</option>
                    <option value="*/4">Every 4 hours (*/4)</option>
                    <option value="*/6">Every 6 hours (*/6)</option>
                </select>
            </div>

            <div class="field">
                <label for="day">Day of Month (1-31)</label>
                <select id="day">
                    <option value="*">Every day (*)</option>
                    <option value="1">1st of month</option>
                    <option value="15">15th of month</option>
                    <option value="1,15">1st and 15th</option>
                </select>
            </div>

            <div class="field">
                <label for="month">Month (1-12)</label>
                <select id="month">
                    <option value="*">Every month (*)</option>
                    <option value="1">January</option>
                    <option value="6">June</option>
                    <option value="12">December</option>
                    <option value="1,4,7,10">Quarterly (1,4,7,10)</option>
                </select>
            </div>

            <div class="field">
                <label for="weekday">Day of Week (0-6)</label>
                <select id="weekday">
                    <option value="*">Every weekday (*)</option>
                    <option value="0">Sunday</option>
                    <option value="1">Monday</option>
                    <option value="2">Tuesday</option>
                    <option value="3">Wednesday</option>
                    <option value="4">Thursday</option>
                    <option value="5">Friday</option>
                    <option value="6">Saturday</option>
                    <option value="1-5">Weekdays (Mon-Fri)</option>
                    <option value="0,6">Weekends (Sat-Sun)</option>
                </select>
            </div>

            <div class="result">
                <label>Generated Cron Expression:</label>
                <div class="cron-output" id="cron-output">* * * * *</div>
                <button id="copy-btn">Copy to Clipboard</button>
            </div>

            <div class="next-run">
                <label>Next 5 Execution Times:</label>
                <ul id="next-runs"></ul>
            </div>
        </section>

        <section class="quick-links">
            <h3>Quick Examples</h3>
            <div class="pages-nav">
                <a href="/pages/every-minute.html">Every Minute</a>
                <a href="/pages/every-hour.html">Every Hour</a>
                <a href="/pages/every-day.html">Every Day</a>
                <a href="/pages/every-week.html">Every Week</a>
                <a href="/pages/every-month.html">Every Month</a>
                <a href="/pages/cron-expression-format.html">Format Guide</a>
                <a href="/pages/crontab-syntax.html">Crontab Syntax</a>
            </div>
        </section>

        <section class="info">
            <h3>What is Cron?</h3>
            <p>Cron is a time-based job scheduler in Unix-like operating systems. Users can schedule jobs to run periodically at specific times, dates, or intervals.</p>
            
            <h3>Cron Expression Format</h3>
            <p>A cron expression consists of 5 fields:</p>
            <ul>
                <li><strong>Minute</strong> (0-59)</li>
                <li><strong>Hour</strong> (0-23)</li>
                <li><strong>Day of Month</strong> (1-31)</li>
                <li><strong>Month</strong> (1-12)</li>
                <li><strong>Day of Week</strong> (0-6, Sunday=0)</li>
            </ul>

            <h3>Common Examples</h3>
            <ul>
                <li><code>0 * * * *</code> - Every hour</li>
                <li><code>0 9 * * *</code> - Every day at 9 AM</li>
                <li><code>0 0 * * *</code> - Every day at midnight</li>
                <li><code>0 0 * * 0</code> - Every Sunday at midnight</li>
                <li><code>*/15 * * * *</code> - Every 15 minutes</li>
            </ul>
        </section>
    </main>

    <footer>
        <p>&copy; 2026 Cron Generator. All rights reserved.</p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
EOF
        echo "✓ 更新首页，添加内链和结构化数据" >> $LOG_FILE
        ;;
        
    11)
        # 更新 sitemap 包含所有页面
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
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-hour.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-day.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-week.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/every-month.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/cron-expression-format.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://cron-generator.com/pages/crontab-syntax.html</loc>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
</urlset>
EOF
        echo "✓ 更新 sitemap.xml 包含所有页面" >> $LOG_FILE
        ;;
        
    12)
        # 创建更多长尾关键词页面 - cron job examples
        cat > "$WORKSPACE/pages/cron-job-examples.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cron Job Examples - Practical Use Cases</title>
    <meta name="description" content="Practical cron job examples for common tasks: backups, logs cleanup, reports generation.">
    <link rel="canonical" href="https://cron-generator.com/pages/cron-job-examples.html">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header><nav><a href="/" class="logo">Cron Generator</a></nav></header>
    <main>
        <h1>Cron Job Examples</h1>
        
        <h2>Backup Jobs</h2>
        <ul>
            <li><code>0 2 * * * /scripts/backup.sh</code> - Daily 2 AM backup</li>
            <li><code>0 3 * * 0 /scripts/weekly-backup.sh</code> - Weekly Sunday backup</li>
        </ul>
        
        <h2>Cleanup Jobs</h2>
        <ul>
            <li><code>0 4 * * * /scripts/cleanup-logs.sh</code> - Daily log cleanup</li>
            <li><code>0 0 * * * find /tmp -type f -mtime +7 -delete</code> - Delete old temp files</li>
        </ul>
        
        <h2>Reports</h2>
        <ul>
            <li><code>0 8 * * 1 /scripts/weekly-report.sh</code> - Weekly report every Monday</li>
            <li><code>0 9 1 * * /scripts/monthly-report.sh</code> - Monthly report on 1st</li>
        </ul>
        
        <a href="/">← Back to Generator</a>
    </main>
</body>
</html>
EOF
        echo "✓ 创建 cron-job-examples.html" >> $LOG_FILE
        ;;
        
    *)
        echo "✓ 第$CURRENT_ROUND 轮优化完成（已达最大轮次）" >> $LOG_FILE
        ;;
esac

# 递增轮次
NEXT_ROUND=$((CURRENT_ROUND + 1))
if [ $NEXT_ROUND -le 20 ]; then
    echo $NEXT_ROUND > "$STATE_FILE"
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - 第$CURRENT_ROUND轮优化完成" >> $LOG_FILE
