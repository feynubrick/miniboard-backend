import { Pool } from 'pg';

export const pool = new Pool({
  host: process.env.MAIN_DB_HOST_URL,
  port: process.env.MAIN_DB_PORT,
  user: process.env.MAIN_DB_USERNAME,
  password: process.env.MAIN_DB_PASSWORD,
  database: process.env.MAIN_DB_DATABASE,
});
