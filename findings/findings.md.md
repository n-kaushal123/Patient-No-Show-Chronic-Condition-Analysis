# Findings

After running the analysis queries on the appointment dataset, here's what the data actually shows:

## Overall No-Show Rate

The overall no-show rate across all appointments is 20.19% roughly 1 in 5 appointments end up as a missed visit. Across a dataset of this size (110,000+ appointments), that adds up to a meaningful amount of lost clinical time.

## Chronic Conditions (Diabetes & Hypertension)

Patients with diabetes and hypertension actually showed lower no-show rates than patients without these conditions:

| Condition    | With condition | Without condition |
| ------------ | -------------- | ----------------- |
| Diabetes     | 18.0%          | 20.36%            |
| Hypertension | 17.3%          | 20.9%             |

This finding is consistent with the expectation that patients managing chronic conditions tend to maintain higher levels of engagement with the healthcare system, owing to regular follow-up requirements and ongoing monitoring.Patients with long-term conditions are used to coming in often, and missing an appointment could set their treatment back, so they're more likely to show up.

## SMS Reminders

Patients who got an SMS reminder had a higher no-show rate (27.57%) than those who didn't (16.7%). At first glance that looks like reminders don't work, but it's more likely explained by the next finding ,reminders tend to go out for appointments booked further in advance, and those already have higher no-show rates on their own. So this is probably a correlation,not proof that SMS reminders backfire.

## Booking Lead Time

This was the clearest pattern in the whole dataset. The longer the gap between booking and the actual appointment, the more likely a no-show:

| Lead Time | No-Show Rate |
| --------- | ------------ |
| Same day  | 4.65%        |
| 1-7 days  | 24.15%       |
| 8-30 days | 31.72%       |
| 30+ days  | 33.03%       |

This is the most useful finding. Hospitals could cut no-shows by keeping bookings short-term, or by making patients confirm any appointment set over a week ahead.
![No-show rate by booking lead time](images/lead_time_chart.png)

## Age Group

| Age Group | No-Show Rate |
| --------- | ------------ |
| Under 18  | 21.91%       |
| 18-35     | 23.83%       |
| 36-55     | 19.69%       |
| 55+       | 16.64%       |

18-35 year olds had the highest no-show rate, older patients (55+) were the most consistent at showing up.

## Summary

Diabetic and hypertensive patients showed lower no-show rates than
patients without these conditions (18.0% vs 20.36% for diabetes; 17.3%
vs 20.9% for hypertension). This makes sense when you consider that
these patients are often dealing with active symptoms or discomfort,
which gives them a direct, felt incentive to attend unlike a routine
checkup, skipping a visit while managing an ongoing condition has
immediate, noticeable consequences. Regular engagement with the
healthcare system likely reinforces this further.

**Note:** These are correlations observed in the data, not confirmed
causal relationships — further statistical testing would be needed to
validate them beyond this exploratory analysis.
