part of appwrite;


class Teams extends Service {
    Teams(Client client): super(client);

     /// List Teams
     ///
     /// Get a list of all the current user teams. You can use the query params to
     /// filter your results. On admin mode, this endpoint will return a list of all
     /// of the project's teams. [Learn more about different API
     /// modes](/docs/admin).
     ///
    Future<Response> list({String? search, int? limit, int? offset, OrderType? orderType}) {
        final String path = '/teams';

        final Map<String, dynamic> params = {
            'search': search,
            'limit': limit,
            'offset': offset,
            'orderType': orderType?.name(),
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Create Team
     ///
     /// Create a new team. The user who creates the team will automatically be
     /// assigned as the owner of the team. The team owner can invite new members,
     /// who will be able add new owners and update or delete the team from your
     /// project.
     ///
    Future<Response> create({required String name, List? roles}) {
        final String path = '/teams';

        final Map<String, dynamic> params = {
            'name': name,
            'roles': roles,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.post, path: path, params: params, headers: headers);
    }

     /// Get Team
     ///
     /// Get a team by its unique ID. All team members have read access for this
     /// resource.
     ///
    Future<Response> get({required String teamId}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Update Team
     ///
     /// Update a team by its unique ID. Only team owners have write access for this
     /// resource.
     ///
    Future<Response> update({required String teamId, required String name}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
            'name': name,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.put, path: path, params: params, headers: headers);
    }

     /// Delete Team
     ///
     /// Delete a team by its unique ID. Only team owners have write access for this
     /// resource.
     ///
    Future<Response> delete({required String teamId}) {
        final String path = '/teams/{teamId}'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Get Team Memberships
     ///
     /// Get a team members by the team unique ID. All team members have read access
     /// for this list of resources.
     ///
    Future<Response> getMemberships({required String teamId, String? search, int? limit, int? offset, OrderType? orderType}) {
        final String path = '/teams/{teamId}/memberships'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
            'search': search,
            'limit': limit,
            'offset': offset,
            'orderType': orderType?.name(),
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.get, path: path, params: params, headers: headers);
    }

     /// Create Team Membership
     ///
     /// Use this endpoint to invite a new member to join your team. An email with a
     /// link to join the team will be sent to the new member email address if the
     /// member doesn't exist in the project it will be created automatically.
     /// 
     /// Use the 'URL' parameter to redirect the user from the invitation email back
     /// to your app. When the user is redirected, use the [Update Team Membership
     /// Status](/docs/client/teams#teamsUpdateMembershipStatus) endpoint to allow
     /// the user to accept the invitation to the team.
     /// 
     /// Please note that in order to avoid a [Redirect
     /// Attacks](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
     /// the only valid redirect URL's are the once from domains you have set when
     /// added your platforms in the console interface.
     ///
    Future<Response> createMembership({required String teamId, required String email, required List roles, required String url, String? name}) {
        final String path = '/teams/{teamId}/memberships'.replaceAll(RegExp('{teamId}'), teamId);

        final Map<String, dynamic> params = {
            'email': email,
            'name': name,
            'roles': roles,
            'url': url,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.post, path: path, params: params, headers: headers);
    }

     /// Update Membership Roles
    Future<Response> updateMembershipRoles({required String teamId, required String membershipId, required List roles}) {
        final String path = '/teams/{teamId}/memberships/{membershipId}'.replaceAll(RegExp('{teamId}'), teamId).replaceAll(RegExp('{membershipId}'), membershipId);

        final Map<String, dynamic> params = {
            'roles': roles,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.patch, path: path, params: params, headers: headers);
    }

     /// Delete Team Membership
     ///
     /// This endpoint allows a user to leave a team or for a team owner to delete
     /// the membership of any other team member. You can also use this endpoint to
     /// delete a user membership even if it is not accepted.
     ///
    Future<Response> deleteMembership({required String teamId, required String membershipId}) {
        final String path = '/teams/{teamId}/memberships/{membershipId}'.replaceAll(RegExp('{teamId}'), teamId).replaceAll(RegExp('{membershipId}'), membershipId);

        final Map<String, dynamic> params = {
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.delete, path: path, params: params, headers: headers);
    }

     /// Update Team Membership Status
     ///
     /// Use this endpoint to allow a user to accept an invitation to join a team
     /// after being redirected back to your app from the invitation email recieved
     /// by the user.
     ///
    Future<Response> updateMembershipStatus({required String teamId, required String membershipId, required String userId, required String secret}) {
        final String path = '/teams/{teamId}/memberships/{membershipId}/status'.replaceAll(RegExp('{teamId}'), teamId).replaceAll(RegExp('{membershipId}'), membershipId);

        final Map<String, dynamic> params = {
            'userId': userId,
            'secret': secret,
        };

        final Map<String, String> headers = {
            'content-type': 'application/json',
        };

        return client.call(HttpMethod.patch, path: path, params: params, headers: headers);
    }
}