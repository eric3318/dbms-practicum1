export const getAveragePlayTimePerPlayer = async () => {
  const res = await fetch('http://localhost/api/analytics/playtime.php?type=average');
  const text = await res.text();
  console.log("Average Playtime Raw:", text);

  try {
    return JSON.parse(text);
  } catch (err) {
    throw new Error("Invalid JSON from average playtime");
  }
};

export const getWeeklyPlayTimeByPlayer = async (startDate = '') => {
  const url = new URL('http://localhost/api/analytics/playtime.php');
  url.searchParams.append('type', 'total');
  if (startDate) {
    url.searchParams.append('start', startDate);
  }

  const res = await fetch(url.toString());
  const text = await res.text();
  console.log("Weekly Playtime Raw:", text);

  try {
    return JSON.parse(text);
  } catch (err) {
    throw new Error("Invalid JSON from weekly playtime");
  }
};

