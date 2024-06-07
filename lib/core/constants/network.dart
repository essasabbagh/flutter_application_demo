const apiKey = '035481509d2c407ba21145547231109';
const baseUrl = 'http://api.weatherapi.com/v1/current.json';

const geolocationApiKey = '62d8d690-e7b8-11ed-8c81-cbb990727ab5';
const geolocationBaseUrl = 'http://ip-api.com/json/';

// const int kTimeOut = 15000; // 15 seconds
const int timeout = Duration.millisecondsPerMinute; // 60 seconds
const Duration timeoutDuration = Duration(milliseconds: timeout);
