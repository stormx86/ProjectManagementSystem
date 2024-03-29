package pl.kozhanov.projectmanagementsystem.service.validation;

import org.springframework.beans.factory.annotation.Autowired;
import pl.kozhanov.projectmanagementsystem.service.impl.UserServiceImpl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class NewUserValidator implements ConstraintValidator<NewUserConstraint, String> {

    @Autowired
    UserServiceImpl userService;

    @Override
    public void initialize(NewUserConstraint constraintAnnotation) {
    }

    @Override
    public boolean isValid(String username, ConstraintValidatorContext constraintValidatorContext) {
        return !userService.findAll().contains(userService.findByUsername(username));
    }
}
