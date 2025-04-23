# 📊 Learning R Shiny

## 📝 Project Description

This is my first R Shiny project, aimed at creating a trend line plot to visualize NSE Index data. The application fetches data from the NSE website and displays an interactive line plot through a Shiny web interface.

This project is based on the [Shiny documentation](https://shiny.posit.co/r/getstarted/shiny-basics/) and serves as a hands-on learning exercise to demonstrate my skills in developing R Shiny applications.

---

## 🚀 Features

- Fetches and displays NSE Index data
- Interactive trend line visualization
- Clean and minimal UI using R Shiny components

---

## 🔧 Installation

To run this project locally, follow the steps below:

1. Clone the repository:
   ```bash
   git clone https://github.com/Rajasekaran-Elangovan/learnr-shiny.git
   cd learnr-shiny
2. Open R or RStudio and install the required packages:
```
install.packages("shiny")
install.packages("SafetyData")
install.packages("Tidyverse")
```
3. Run the application:
```
shiny::runApp()
```
📁 Project Structure
```
learnr-shiny/
│
├── shiny_trend.R                # Main Shiny application file
├── README.md            # Project documentation
└── ADHT.R               # Data Processing
```
🤝 Contributing:

As this is a personal learning project, contributions are currently not expected. However, feel free to fork the repository and explore your own implementations.

📜 License:

This project is licensed under the MIT License.

🙌 Acknowledgments:

Shiny by Posit – for documentation and examples that inspired this project.
NSE India – for providing publicly accessible data for visualization.
