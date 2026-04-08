/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {
      colors: {
        brand: "#10b981",
        urgency: "#f59e0b",
        ink: "#0f172a",
      },
      boxShadow: {
        panel: "0 18px 45px rgba(15, 23, 42, 0.08)",
      },
      fontFamily: {
        sans: ["ui-sans-serif", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
};
