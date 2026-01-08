"""Functions to prevent a nuclear meltdown."""


def is_criticality_balanced(temperature, neutrons_emitted):

    return (temperature < 800) and (neutrons_emitted > 500) and (temperature * neutrons_emitted < 500000)


def reactor_efficiency(voltage, current, theoretical_max_power):
    generated_power = voltage * current
    efficiency_label = (generated_power/theoretical_max_power) * 100

    if efficiency_label >= 80:
        return "green"
    elif efficiency_label >= 60:
        return "orange"
    elif efficiency_label >= 30:
        return "red"
    else:
        return "black"


def fail_safe(temperature, neutrons_produced_per_second, threshold):
    """Assess and return status code for the reactor.

    :param temperature: int or float - value of the temperature in kelvin.
    :param neutrons_produced_per_second: int or float - neutron flux.
    :param threshold: int or float - threshold for category.
    :return: str - one of ('LOW', 'NORMAL', 'DANGER').

    1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
    2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
    3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """

    safe_label = temperature * neutrons_produced_per_second

    if safe_label < (threshold * 0.9):
        return "LOW"
    elif (threshold * 0.9) <= safe_label <= (threshold * 1.1):
        return "NORMAL"
    else:
        return "DANGER"
        
    

    pass
