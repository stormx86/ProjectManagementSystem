package pl.kozhanov.projectmanagementsystem.service.impl;

import org.springframework.stereotype.Service;
import pl.kozhanov.projectmanagementsystem.domain.ProjectStatus;
import pl.kozhanov.projectmanagementsystem.repos.ProjectStatusRepo;
import pl.kozhanov.projectmanagementsystem.service.ProjectStatusService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectStatusServiceImpl implements ProjectStatusService {

    private final ProjectStatusRepo projectStatusRepo;

    public ProjectStatusServiceImpl(final ProjectStatusRepo projectStatusRepo) {
        this.projectStatusRepo = projectStatusRepo;
    }

    public ProjectStatus findByStatusName(String statusName) {
        return projectStatusRepo.findByStatusName(statusName);
    }

    public List<String> findAllStatuses() {
        List<String> statuses = new ArrayList<>();
        projectStatusRepo.findAll().forEach(status -> statuses.add(status.getStatusName()));
        return statuses;
    }
}
