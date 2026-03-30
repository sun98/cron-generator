document.addEventListener('DOMContentLoaded', function() {
    const minuteSelect = document.getElementById('minute');
    const hourSelect = document.getElementById('hour');
    const daySelect = document.getElementById('day');
    const monthSelect = document.getElementById('month');
    const weekdaySelect = document.getElementById('weekday');
    const cronOutput = document.getElementById('cron-output');
    const nextRunsList = document.getElementById('next-runs');
    const copyBtn = document.getElementById('copy-btn');

    function updateCron() {
        const cron = [
            minuteSelect.value,
            hourSelect.value,
            daySelect.value,
            monthSelect.value,
            weekdaySelect.value
        ].join(' ');

        cronOutput.textContent = cron;
        updateNextRuns(cron);
    }

    function updateNextRuns(cron) {
        const parts = cron.split(' ');
        if (parts.length !== 5) return;

        const [minute, hour, day, month, weekday] = parts;
        const runs = [];
        const now = new Date();

        for (let i = 0; i < 5; i++) {
            const next = findNextExecution(now, minute, hour, day, month, weekday, i === 0 ? 0 : 1);
            if (next) {
                runs.push(formatDate(next));
                now.setTime(next.getTime() + 60000);
            }
        }

        nextRunsList.innerHTML = runs.map(run => `<li>${run}</li>`).join('');
    }

    function findNextExecution(startFrom, minute, hour, day, month, weekday, daysToAdd = 0) {
        const date = new Date(startFrom);
        date.setDate(date.getDate() + daysToAdd);
        date.setSeconds(0);
        date.setMilliseconds(0);

        const mins = parseField(minute, 0, 59);
        const hours = parseField(hour, 0, 23);
        const days = parseField(day, 1, 31);
        const months = parseField(month, 1, 12);
        const weekdays = parseField(weekday, 0, 6);

        for (let i = 0; i < 366 * 24 * 60; i++) {
            const m = date.getMonth() + 1;
            const d = date.getDate();
            const wd = date.getDay();
            const h = date.getHours();
            const min = date.getMinutes();

            // Check date constraints
            if (!months.includes(m)) {
                date.setMonth(date.getMonth() + 1);
                date.setDate(1);
                date.setHours(0, 0, 0, 0);
                continue;
            }
            if (!days.includes(d)) {
                date.setDate(date.getDate() + 1);
                date.setHours(0, 0, 0, 0);
                continue;
            }
            if (!weekdays.includes(wd)) {
                date.setDate(date.getDate() + 1);
                date.setHours(0, 0, 0, 0);
                continue;
            }

            // Check hour constraint
            if (!hours.includes(h)) {
                // Jump to next valid hour
                const nextHourIdx = hours.findIndex(hh => hh > h);
                if (nextHourIdx === -1) {
                    date.setDate(date.getDate() + 1);
                    date.setHours(0, 0, 0, 0);
                } else {
                    date.setHours(hours[nextHourIdx], 0, 0, 0);
                }
                continue;
            }

            // Check minute constraint
            if (!mins.includes(min)) {
                const nextMinIdx = mins.findIndex(mm => mm > min);
                if (nextMinIdx === -1) {
                    // Move to next hour
                    date.setHours(date.getHours() + 1, 0, 0, 0);
                } else {
                    date.setMinutes(mins[nextMinIdx], 0, 0);
                }
                continue;
            }

            return date;
        }

        return null;
    }

    function parseField(value, min, max) {
        if (value === '*') {
            return Array.from({length: max - min + 1}, (_, i) => i + min);
        }

        if (value.includes(',')) {
            return value.split(',').flatMap(v => parseField(v, min, max));
        }

        if (value.includes('-')) {
            const [start, end] = value.split('-').map(Number);
            return Array.from({length: end - start + 1}, (_, i) => start + i);
        }

        if (value.includes('/')) {
            const step = parseInt(value.split('/')[1]);
            return Array.from({length: Math.floor((max - min) / step) + 1}, (_, i) => min + i * step);
        }

        return [parseInt(value)];
    }

    function formatDate(date) {
        const options = {
            weekday: 'short',
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };
        return date.toLocaleDateString('en-US', options);
    }

    // Event listeners
    [minuteSelect, hourSelect, daySelect, monthSelect, weekdaySelect].forEach(select => {
        select.addEventListener('change', updateCron);
    });

    // Preset buttons
    document.querySelectorAll('.preset-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const cron = this.dataset.cron;
            const parts = cron.split(' ');
            if (parts.length === 5) {
                minuteSelect.value = parts[0];
                hourSelect.value = parts[1];
                daySelect.value = parts[2];
                monthSelect.value = parts[3];
                weekdaySelect.value = parts[4];
                updateCron();
            }
        });
    });

    // Copy button — Clipboard API with execCommand fallback
    copyBtn.addEventListener('click', async function() {
        const textToCopy = cronOutput.textContent;

        try {
            await navigator.clipboard.writeText(textToCopy);
            showCopySuccess();
        } catch (err) {
            // Fallback for older browsers
            const textArea = document.createElement('textarea');
            textArea.value = textToCopy;
            textArea.style.position = 'fixed';
            textArea.style.left = '-999999px';
            textArea.style.top = '-999999px';
            textArea.style.opacity = '0';
            document.body.appendChild(textArea);
            textArea.focus();
            textArea.select();
            try {
                document.execCommand('copy');
                showCopySuccess();
            } catch (e) {
                showCopyFail();
            }
            document.body.removeChild(textArea);
        }
    });

    function showCopySuccess() {
        copyBtn.classList.remove('copy-fail');
        copyBtn.textContent = 'Copied!';
        copyBtn.classList.add('copy-success');
        setTimeout(function() {
            copyBtn.textContent = 'Copy to Clipboard';
            copyBtn.classList.remove('copy-success');
        }, 2000);
    }

    function showCopyFail() {
        copyBtn.classList.remove('copy-success');
        copyBtn.textContent = 'Copy failed';
        copyBtn.classList.add('copy-fail');
        setTimeout(function() {
            copyBtn.textContent = 'Copy to Clipboard';
            copyBtn.classList.remove('copy-fail');
        }, 2000);
    }

    // Initial update
    updateCron();
});
