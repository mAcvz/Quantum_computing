import numpy as np 
import matplotlib.pyplot as plt
from scipy import stats

file_name = "time_vs_dim_2.txt"
# Initialize empty lists for x and y values
x = []
y = []

# Open the file for reading
with open(file_name, "r") as file:
    # Iterate through each line in the file
    for line in file:
        # Split the line into two parts using the comma as the separator
        parts = line.strip().split(',')
        
        # Convert the first part (before the comma) to an integer and append it to x
        x.append(float(parts[0]))
        
        # Convert the second part (after the comma) to a float and append it to y
        y.append(float(parts[1]))

# Print the values (optional)
#for i in range(len(x)):
#    print(f"x: {x[i]}, y: {y[i]}")

x = np.log(x) 
y = np.log(y)

# Perform linear regression
slope, intercept, r_value, p_value, std_err = stats.linregress(x, y)

# Output the results
print(f"Slope (m): {slope}")
print(f"Intercept (b): {intercept}")
print(f"R-squared: {r_value**2}")

plt.scatter(x,y, label = " computed data ")
# Calculate the predicted y values using the linear regression equation
predicted_y = slope * np.array(x) + intercept

# Plot the linear fit line
plt.plot(x, predicted_y, color='red', label='Linear Fit')

plt.xlabel("log(N)")
plt.ylabel("log(Time) [s]")
plt.title("Time vs N")
plt.legend()
plt.show()