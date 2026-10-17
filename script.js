document.addEventListener('DOMContentLoaded', () => {
    loadLaws();
});

async function loadLaws() {
    const container = document.getElementById('laws-container');
    if (!container) return;

    try {
        const response = await fetch('data.json');
        if (!response.ok) {
            throw new Error(`Ошибка сети: ${response.status}`);
        }
        const laws = await response.json();
        renderCards(laws, container);
    } catch (error) {
        console.warn('Не удалось загрузить data.json через fetch (возможно, запуск через file://):', error);
        // Резервные данные на случай открытия файла напрямую без локального веб-сервера
        const fallbackData = [
            {
                title: "Цифровой кодекс",
                number: "255-VIII",
                year: 2026,
                in_force: true
            },
            {
                title: "Гражданский кодекс (Общая часть)",
                number: "268-XIII",
                year: 1994,
                in_force: true
            },
            {
                title: "Закон «О кибербезопасности»",
                number: "418-V",
                year: 2015,
                in_force: true
            }
        ];
        renderCards(fallbackData, container);
    }
}

function renderCards(laws, container) {
    container.innerHTML = '';

    if (!Array.isArray(laws) || laws.length === 0) {
        container.innerHTML = '<p class="empty-state">Список законов пуст.</p>';
        return;
    }

    laws.forEach((law) => {
        const card = document.createElement('article');
        card.className = 'law-card';

        const isInForce = Boolean(law.in_force);
        const statusClass = isInForce ? 'status-active' : 'status-inactive';
        const statusText = isInForce ? 'Действует' : 'Не действует';

        // Заголовок и статус
        const headerEl = document.createElement('div');
        headerEl.className = 'law-header';

        const titleEl = document.createElement('h3');
        titleEl.className = 'law-title';
        titleEl.textContent = law.title || 'Без названия';

        const statusEl = document.createElement('span');
        statusEl.className = `law-status ${statusClass}`;
        statusEl.textContent = statusText;

        headerEl.appendChild(titleEl);
        headerEl.appendChild(statusEl);

        // Сведения о номере и годе
        const detailsEl = document.createElement('div');
        detailsEl.className = 'law-details';

        const numberEl = document.createElement('p');
        numberEl.className = 'law-number';

        const numberLabel = document.createElement('span');
        numberLabel.className = 'law-label';
        numberLabel.textContent = 'Номер: ';

        const numberValue = document.createElement('strong');
        numberValue.textContent = law.number || 'не указан';

        numberEl.appendChild(numberLabel);
        numberEl.appendChild(numberValue);

        if (law.year) {
            const yearText = document.createTextNode(` (${law.year} г.)`);
            numberEl.appendChild(yearText);
        }

        detailsEl.appendChild(numberEl);

        card.appendChild(headerEl);
        card.appendChild(detailsEl);

        container.appendChild(card);
    });
}
