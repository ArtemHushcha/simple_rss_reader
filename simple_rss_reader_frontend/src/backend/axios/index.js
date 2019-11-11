import axios from 'axios'

const API_URL = 'http://localhost:3000'

const plainAxiosInstance = axios.create({
  baseURL: API_URL,
  headers: {
    'Acces-Control-Allow-Origin': '*',
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  }
})

export { plainAxiosInstance }
