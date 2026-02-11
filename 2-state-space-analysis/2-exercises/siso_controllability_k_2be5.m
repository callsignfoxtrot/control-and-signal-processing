clear all;

% Given system matrices
A = [-1 0 0; 0 -2 -2; -1 0 -3];
B_cases = {[1;1;1], [1;1;0]}; % B1 and B2
desired_poles = [-2 -4 -6]; % desired closed-loop poles

for i = 1:2
    B = B_cases{i};
    fprintf('\n=== Case B%d ===\n', i);
    
    % (i) Controllability
    CO = [B A*B A^2*B]; % controllability matrix
    nc = size(A,1);
    rankCO = rank(CO);
    fprintf('Rank of controllability matrix: %d\n', rankCO);
    if rankCO == nc
        disp('System is controllable')
    else
        disp('System is not controllable')
    end
    
    % (ii) Eigenvalues of A
    eigA = eig(A);
    fprintf('Eigenvalues of A: '); disp(eigA');
    
    % (iii) Transformation matrix to controllable canonical form
    % Characteristic polynomial of A
    ja = poly(A); % ja(1) = 1, ja(2:end) are coefficients
    a1 = ja(2); a2 = ja(3); a3 = ja(4);
    
    % Weighing matrix for 3rd-order system
    w = [a2 a1 1; a1 1 0; 1 0 0]; % standard formula for 3rd-order
    V = CO * w; % transformation matrix
    fprintf('Transformation matrix V:\n'); disp(V);
    
   % (iv) State feedback matrix K for desired poles
    % Desired characteristic polynomial
    jd = poly(desired_poles);
    alpha1 = jd(2); alpha2 = jd(3); alpha3 = jd(4);
    
    % Last row of controllable canonical form of A
    k = [alpha3-a3, alpha2-a2, alpha1-a1]; % gains in canonical form
    K = k * inv(V); % feedback gain in original coordinates
    fprintf('State feedback matrix K:\n'); disp(K);
    
    % Closed-loop system
    Acl = A - B*K;
    fprintf('Closed-loop eigenvalues: '); disp(eig(Acl)');
    
    % Stability check
    if all(real(eig(Acl)) < 0)
        disp('Closed-loop system is stable')
    else
        disp('Closed-loop system is unstable')
    end
    
end
